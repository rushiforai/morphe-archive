.class public Ll/quq$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/quq;->N(Lcom/p1/mobile/android/app/Act;Ll/dvl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/y20<",
        "Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;",
        ">;"
    }
.end annotation


# instance fields
.field public final synthetic a:Lv/VIcon;


# direct methods
.method public constructor <init>(Lv/VIcon;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/quq$b;->a:Lv/VIcon;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->j3()Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 10
    .line 11
    if-eq p1, v0, :cond_1

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->CLICK_RUNNING:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 14
    .line 15
    if-ne p1, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Ll/quq$b;->a:Lv/VIcon;

    .line 19
    .line 20
    sget p1, Ll/dbc0;->cd:I

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/quq$b;->a:Lv/VIcon;

    .line 27
    .line 28
    sget p1, Ll/dbc0;->dd:I

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/quq$b;->a(Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
