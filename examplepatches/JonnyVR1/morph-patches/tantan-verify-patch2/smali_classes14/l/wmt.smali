.class public Ll/wmt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ll/bnt;Ll/ent;)V
    .locals 13

    .line 1
    new-instance v0, Ll/pmt;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/klt;->E2()Ll/imt;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    iget-object v3, p1, Ll/ent;->k:Lv/VRecyclerView;

    .line 8
    .line 9
    iget-object v4, p1, Ll/ent;->i:Lv/VText;

    .line 10
    .line 11
    iget-object v1, p1, Ll/ent;->j:Lv/VSearchBar;

    .line 12
    .line 13
    invoke-virtual {v1}, Lv/VSearchBar;->getEditText()Lv/VEditText;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    move-object v1, p0

    .line 18
    invoke-direct/range {v0 .. v5}, Ll/pmt;-><init>(Ll/ner;Ll/imt;Lv/VRecyclerView;Lv/VText;Lv/VEditText;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 22
    .line 23
    .line 24
    new-instance p0, Ll/tmt;

    .line 25
    .line 26
    invoke-virtual {v1}, Ll/klt;->E2()Ll/imt;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v2, p1, Ll/ent;->q:Landroid/widget/LinearLayout;

    .line 31
    .line 32
    iget-object v3, p1, Ll/ent;->s:Lcom/p1/mobile/putong/live/base/view/ScrollRecycleView;

    .line 33
    .line 34
    invoke-direct {p0, v1, v0, v2, v3}, Ll/tmt;-><init>(Ll/ner;Ll/imt;Landroid/widget/LinearLayout;Lv/VRecyclerView;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, p0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 38
    .line 39
    .line 40
    new-instance v6, Ll/ylt;

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/klt;->E2()Ll/imt;

    .line 43
    .line 44
    .line 45
    move-result-object v8

    .line 46
    iget-object v9, p1, Ll/ent;->m:Landroid/widget/LinearLayout;

    .line 47
    .line 48
    iget-object v10, p1, Ll/ent;->n:Lv/VRecyclerView;

    .line 49
    .line 50
    iget-object v11, p1, Ll/ent;->o:Lv/VText;

    .line 51
    .line 52
    iget-object v12, p1, Ll/ent;->p:Landroid/view/View;

    .line 53
    .line 54
    move-object v7, v1

    .line 55
    invoke-direct/range {v6 .. v12}, Ll/ylt;-><init>(Ll/ner;Ll/imt;Landroid/widget/LinearLayout;Lv/VRecyclerView;Lv/VText;Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, v6}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 59
    .line 60
    .line 61
    return-void
.end method
