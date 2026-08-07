.class public Ll/dy80$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/dy80;->A(Lcom/p1/mobile/putong/data/Settings;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/dy80;


# direct methods
.method public constructor <init>(Ll/dy80;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dy80$b;->a:Ll/dy80;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/dy80$b;->a:Ll/dy80;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object v0, p1, Ll/dy80;->j:Lv/VSlider;

    .line 6
    .line 7
    invoke-virtual {v0}, Lv/VSlider;->getValue()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1, v0}, Ll/dy80;->l(F)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p1, Ll/dy80;->j:Lv/VSlider;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p1, v0}, Lv/VSlider;->setValue(F)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/dy80$b;->a:Ll/dy80;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Ll/dy80;->l(F)V

    .line 24
    .line 25
    .line 26
    :goto_0
    iget-object p0, p0, Ll/dy80$b;->a:Ll/dy80;

    .line 27
    .line 28
    if-eqz p2, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/dy80;->B()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    invoke-virtual {p0}, Ll/dy80;->p()V

    .line 35
    .line 36
    .line 37
    return-void
.end method
