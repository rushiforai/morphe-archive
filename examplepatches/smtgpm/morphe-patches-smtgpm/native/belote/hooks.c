/*
 * Copyright 2026 smtgpm.
 * https://github.com/smtgpm/morphe-patches-smtgpm
 *
 * Belote.com 2.12.9 (2216) arm64 hooks for the daily bonus patches:
 *  - "Auto-collect daily wheel": spin, collect and close an opened wheel.
 *  - "Claim daily bonus automatically": claim the free spin from the menu, no wheel.
 *
 * Linked at a fixed address inside libil2cpp.so (the unused web-only
 * StartupManagerFsmWeb::DefineFsm body). Game functions are absolute symbols
 * from link.ld; IL2CPP methods take (this, args..., MethodInfo*).
 * Rebuild with `python3 build.py` after any change.
 */
typedef unsigned char u8;

/* Trampolines (hooks.S): run the displaced first instruction, then the original. */
void orig_wheel_show(u8 *self, void *mi);
void orig_wheel_free_spin_completed(u8 *self, void *a, void *b, void *mi);
void orig_wheel_collect_done(u8 *self, void *mi);
void orig_menu_show(u8 *self, u8 instant, void *mi);
void orig_menu_refresh_daily_bonus(u8 *self, void *mi);

/* Game functions */
u8   ActivityBonusManager_IsAvailable(void *mgr, int type, void *mi);
void FortuneWheel_OnFreeClicked(u8 *self, void *mi);
void FortuneWheel_OnCollectFreeClicked(u8 *self, void *mi);
void FortuneWheel_OnCloseClicked(u8 *self, void *mi);
int  ActivityBonusManager_GetRewardSlot(void *mgr, int type, void *mi);
void ActivityBonusManager_Claim(void *mgr, int type, int slot, void *source,
                                void *on_done, void *on_error, void *mi);
void System_Action_ctor(void *self, void *target, void *method, void *mi);
void InventoryManager_FetchServerData(void *inventory, void *mi);

/* Public IL2CPP API (exported by libil2cpp.so) */
void *il2cpp_get_corlib(void);
void *il2cpp_class_from_name(void *image, const char *ns, const char *name);
void *il2cpp_class_get_method_from_name(void *klass, const char *name, int argc);
void *il2cpp_object_get_class(void *obj);
void *il2cpp_object_new(void *klass);
void *il2cpp_string_new(const char *str);

/* Writable zero-initialised byte left unused by the replaced method: claim state per launch. */
extern volatile u8 claim_state;
#define CLAIM_NONE      0
#define CLAIM_SENT      1
#define CLAIM_DONE      2


/* ActivityBonus type 4 is the free daily wheel spin. */
#define FREE_WHEEL 4

/* FortuneWheelUIViewController fields */
#define FW_BONUS_MGR      0x28
#define FW_HAS_FREE_REWARD 0x98
#define FW_IS_DISPOSED    0x9e
#define FW_IS_SPINNING    0xa0
/* MenuUIViewController fields */
#define MENU_BONUS_MGR    0x30
#define MENU_INVENTORY_MGR 0xc8
#define MENU_IS_DISPOSED  0x163

#define TEXT_STR __attribute__((section(".text.str")))
static const char S_SYSTEM[] TEXT_STR = "System";
static const char S_ACTION[] TEXT_STR = "Action";
static const char S_REFRESH[] TEXT_STR = "RefreshDailyBonus";
static const char S_WHEEL[] TEXT_STR = "WHEEL"; /* source the wheel sends */

static int free_spin_available(void *mgr) {
    return mgr && (ActivityBonusManager_IsAvailable(mgr, FREE_WHEEL, 0) & 1);
}

/* Wheel opened: spin the free wheel instead of waiting for a tap. */
void hook_wheel_show(u8 *self, void *mi) {
    orig_wheel_show(self, mi);
    if (!self || self[FW_IS_DISPOSED] || self[FW_IS_SPINNING] || self[FW_HAS_FREE_REWARD]) return;
    if (free_spin_available(*(void **)(self + FW_BONUS_MGR)))
        FortuneWheel_OnFreeClicked(self, 0);
}

/* Free spin finished and the reward is waiting: press Collect. */
void hook_wheel_free_spin_completed(u8 *self, void *a, void *b, void *mi) {
    orig_wheel_free_spin_completed(self, a, b, mi);
    if (self && self[FW_HAS_FREE_REWARD] && !self[FW_IS_DISPOSED])
        FortuneWheel_OnCollectFreeClicked(self, 0);
}

/* Collected chips finished animating: close the wheel. */
void hook_wheel_collect_done(u8 *self, void *mi) {
    orig_wheel_collect_done(self, mi);
    if (self && !self[FW_IS_DISPOSED] && !self[FW_IS_SPINNING] && !self[FW_HAS_FREE_REWARD])
        FortuneWheel_OnCloseClicked(self, 0);
}

/* new System.Action(target.method) through the public IL2CPP API. */
static void *new_action(void *target, const char *method) {
    void *action_class = il2cpp_class_from_name(il2cpp_get_corlib(), S_SYSTEM, S_ACTION);
    void *mi = il2cpp_class_get_method_from_name(il2cpp_object_get_class(target), method, 0);
    if (!action_class || !mi) return 0;
    void *action = il2cpp_object_new(action_class);
    if (action) System_Action_ctor(action, target, mi, 0);
    return action;
}

/*
 * Claim the free spin once per launch, the same call the wheel makes but without the wheel:
 * ActivityBonusManager.Claim(4, server reward slot, "WHEEL", onDone: null, onError).
 * On success the manager stores the next claim time and fires its availability signal;
 * the server pushes the chip balance update. onError must be a real delegate (the game
 * invokes it without a null check); menu.RefreshDailyBonus just refreshes the badge.
 */
static void try_claim(u8 *menu) {
    if (!menu || claim_state != CLAIM_NONE || menu[MENU_IS_DISPOSED]) return;
    void *mgr = *(void **)(menu + MENU_BONUS_MGR);
    if (!free_spin_available(mgr)) return;
    int slot = ActivityBonusManager_GetRewardSlot(mgr, FREE_WHEEL, 0);
    if (slot < 0) return;
    void *on_error = new_action(menu, S_REFRESH);
    void *source = il2cpp_string_new(S_WHEEL);
    if (!on_error || !source) return;
    claim_state = CLAIM_SENT;
    ActivityBonusManager_Claim(mgr, FREE_WHEEL, slot, source, 0, on_error, 0);
}

/* Menu shown. */
void hook_menu_show(u8 *self, u8 instant, void *mi) {
    orig_menu_show(self, instant, mi);
    try_claim(self);
}

/*
 * The claim's success handler fires the availability signal, which lands here with the spin
 * no longer available. The wheel normally applies the chips itself, so reload the inventory
 * once: InventoryManagerUpdatedSignal then refreshes the menu's chip counter.
 */
static void refresh_after_claim(u8 *menu) {
    if (claim_state != CLAIM_SENT || !menu || menu[MENU_IS_DISPOSED]) return;
    if (free_spin_available(*(void **)(menu + MENU_BONUS_MGR))) return;
    void *inventory = *(void **)(menu + MENU_INVENTORY_MGR);
    if (!inventory) return;
    claim_state = CLAIM_DONE;
    InventoryManager_FetchServerData(inventory, 0);
}

/* Bonus availability or inventory changed (also runs from Menu.Apply). */
void hook_menu_refresh_daily_bonus(u8 *self, void *mi) {
    orig_menu_refresh_daily_bonus(self, mi);
    refresh_after_claim(self);
    try_claim(self);
}
