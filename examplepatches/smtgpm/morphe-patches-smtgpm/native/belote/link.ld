/*
 * Copyright 2026 smtgpm. https://github.com/smtgpm/morphe-patches-smtgpm
 *
 * Belote.com 2.12.9 (2216) arm64 libil2cpp.so virtual addresses.
 */
CAVE = 0x1cf6d54;  /* StartupManagerFsmWeb::DefineFsm (web build only, 39844 bytes) */

FortuneWheel_Show                 = 0x1e10ba0;
FortuneWheel_OnFreeSpinCompleted  = 0x1e126f4;
FortuneWheel_CollectFreeDone      = 0x1e15934; /* <CollectFree>b__55_0 */
FortuneWheel_OnFreeClicked        = 0x1e124a8;
FortuneWheel_OnCollectFreeClicked = 0x1e11ad8;
FortuneWheel_OnCloseClicked       = 0x1e11aa0;
ActivityBonusManager_IsAvailable  = 0x1c2c094;
Menu_Show                         = 0x1e27204; /* Show(bool), pushes the menu on the view stack */
Menu_RefreshDailyBonus            = 0x1e1ffe0;
ActivityBonusManager_GetRewardSlot = 0x1c2c05c;
ActivityBonusManager_Claim        = 0x1c2bd70;
System_Action_ctor                = 0x2f41ff4;
InventoryManager_FetchServerData  = 0x1c4e4ac;

/* Exported IL2CPP API */
il2cpp_get_corlib                 = 0x1a5f97c;
il2cpp_class_from_name            = 0x1a5f9ec;
il2cpp_class_get_method_from_name = 0x1a5fa14;
il2cpp_object_get_class           = 0x1a602b4;
il2cpp_object_new                 = 0x1a602c0;
il2cpp_string_new                 = 0x1a60324;
claim_state                       = 0x402980b; /* DefineFsm's lazy-init flag (.bss) */

SECTIONS {
    . = CAVE;
    .text : { *(.text .text.*) }
    /DISCARD/ : { *(.comment) *(.note*) *(.eh_frame*) }
}
ENTRY(hook_wheel_show)
