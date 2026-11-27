// Copyright 2026 smtgpm. https://github.com/smtgpm/morphe-patches-smtgpm
//
// Trampolines: replay each hooked function's displaced first instruction,
// then continue at its second instruction. All displaced instructions are
// PC-independent stack stores (checked by the patch before writing).
.text
.global orig_wheel_show
orig_wheel_show:
    stp x30, x21, [sp, #-0x20]!
    b   FortuneWheel_Show + 4

.global orig_wheel_free_spin_completed
orig_wheel_free_spin_completed:
    str x30, [sp, #-0x50]!
    b   FortuneWheel_OnFreeSpinCompleted + 4

.global orig_wheel_collect_done
orig_wheel_collect_done:
    stp x30, x19, [sp, #-0x10]!
    b   FortuneWheel_CollectFreeDone + 4

.global orig_menu_show
orig_menu_show:
    str x30, [sp, #-0x30]!
    b   Menu_Show + 4

.global orig_menu_refresh_shop
orig_menu_refresh_shop:
    str x30, [sp, #-0x30]!
    b   Menu_RefreshShop + 4

.global orig_menu_refresh_daily_bonus
orig_menu_refresh_daily_bonus:
    str x30, [sp, #-0x30]!
    b   Menu_RefreshDailyBonus + 4
