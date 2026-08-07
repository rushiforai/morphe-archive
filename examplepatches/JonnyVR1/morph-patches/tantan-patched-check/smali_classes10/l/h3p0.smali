.class public Ll/h3p0;
.super Ll/ic3;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ic3<",
        "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;",
        ">;"
    }
.end annotation


# instance fields
.field public l:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;

.field public m:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/CharSequence;ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)V
    .locals 6

    .line 1
    iget v4, p4, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->sort:I

    .line 2
    .line 3
    iget-object v5, p4, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->name:Ljava/lang/String;

    .line 4
    .line 5
    move-object v0, p0

    .line 6
    move-object v1, p1

    .line 7
    move-object v2, p2

    .line 8
    move v3, p3

    .line 9
    invoke-direct/range {v0 .. v5}, Ll/ic3;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;IILjava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object p4, v0, Ll/h3p0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public O(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/d3q;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public P(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/ic3;->u(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;->g0(Z)V

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/h3p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/h3p0;->Q()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/h3p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveSettingItemSwitchBindings;->i:Landroid/widget/TextView;

    .line 4
    .line 5
    sget v1, Ll/n9c0;->m1:I

    .line 6
    .line 7
    invoke-static {v1}, Ll/n3d0;->a(I)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/h3p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveSettingItemSwitchBindings;->i:Landroid/widget/TextView;

    .line 17
    .line 18
    const/high16 v1, 0x41400000    # 12.0f

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/h3p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveSettingItemSwitchBindings;->f:Landroid/view/View;

    .line 26
    .line 27
    sget v1, Ll/obc0;->S6:I

    .line 28
    .line 29
    invoke-static {v1}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/h3p0;->l:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveSettingItemSwitchBindings;->g:Landroid/view/View;

    .line 39
    .line 40
    sget v0, Ll/obc0;->R6:I

    .line 41
    .line 42
    invoke-static {v0}, Ll/n3d0;->b(I)Landroid/graphics/drawable/Drawable;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public bridge synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/h3p0;->O(Lcom/p1/mobile/putong/live/livingroom/voice/bottom/items/switchview/VoiceSwitchItemView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->u5:I

    .line 2
    .line 3
    return p0
.end method
