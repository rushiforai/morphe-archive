"""Independent original-index consent edits, bound to West 20.1."""

HOME = ('Lnl/stichtingrpo/news/home/HomeFragment;', 'M()V')
ARTICLE = ('Lf95;', 'b(Ljava/lang/Object;)Ljava/lang/Object;')
NEXT = ('Lva3;', 'onClick(Landroid/view/View;)V')
SCROLL = ('Lei5;', 'onPageScrolled(IFI)V')
COMPOSE_CLICK = ('Lt57;', 'c()Ljava/lang/Object;')
XML_CLICK = ('Lb67;', 'onClick(Landroid/view/View;)V')
COMPOSE_MENU = ('Len;', 'j(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;')
PAGES = ('Lzi5;', '<init>(Lnl/stichtingrpo/news/onboarding/OnboardingActivity;ZZZ)V')
PLAYER = ('Lv70;', 'N(Ljava/lang/String;Ljava/util/Map;)V')


def edit(key, index, original, replacement):
    return dict(owner=key[0], signature=key[1], index=index,
                original=original, replacement=replacement)


CONSENT_EDITS = [
    edit(HOME, 36, ['move-result v1'], ['const/4 v1, 0x0']),
    edit(ARTICLE, 102, ['move-result v6'], ['const/4 v6, 0x0']),
    edit(NEXT, 211, ['invoke-virtual {v0, v1}, Ln90;->y(Lty2;)V'],
         ['invoke-interface {v1}, Lty2;->c()Ljava/lang/Object;']),
    edit(NEXT, 225, ['invoke-virtual {v1, v2, v5, v3}, Lnb1;->b(Lzv0;ZLty2;)V'],
         ['invoke-interface {v3}, Lty2;->c()Ljava/lang/Object;']),
    edit(SCROLL, 105, ['invoke-virtual {v0, p1}, Ln90;->y(Lty2;)V'],
         ['invoke-interface {p1}, Lty2;->c()Ljava/lang/Object;']),
    edit(COMPOSE_CLICK, 63, ['invoke-virtual {v0, p0, v3, v1}, Lnb1;->b(Lzv0;ZLty2;)V'],
         ['return-object v2']),
    edit(XML_CLICK, 48, ['invoke-virtual {p1, p0, v0, v1}, Lnb1;->b(Lzv0;ZLty2;)V'],
         ['return-void']),
    edit(COMPOSE_MENU, 308, ['const v1, 0x7f080340'], ['goto/32 @337']),
    edit(PAGES, 9, ['invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z'], ['nop']),
    edit(PAGES, 12, ['invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z'], ['nop']),
    edit(PAGES, 17, ['invoke-virtual {p1, p3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z'], ['nop']),
    edit(PAGES, 20, ['invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z'], ['nop']),
    edit(('Lnl/stichtingrpo/news/onboarding/OnboardingActivity;', 'onCreate(Landroid/os/Bundle;)V'), 251, [], [
        'invoke-virtual {v2}, Lzi5;->b()I', 'move-result v4',
        'if-nez v4, :west_region_available',
        'invoke-virtual {p0}, Lnl/stichtingrpo/news/onboarding/OnboardingActivity;->C()V',
        'return-void', ':west_region_available']),
    edit(('Lnl/stichtingrpo/news/onboarding/OnboardingActivity;', 'C()V'), 0, [], [
        'invoke-virtual {p0}, Lnl/stichtingrpo/news/onboarding/OnboardingActivity;->D()Lxi5;',
        'move-result-object v0', 'invoke-static {v0}, Lxi5;->morpheSaveRegions(Lxi5;)V']),
    edit(PLAYER, 423, ['iget-object v4, p0, Lv70;->x1:Lqt9;'], ['goto/32 @421']),
]
