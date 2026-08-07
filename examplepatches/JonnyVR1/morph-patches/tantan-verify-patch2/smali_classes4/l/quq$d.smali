.class public Ll/quq$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/quq;->T(Lcom/p1/mobile/android/app/Act;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/jl80;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/quq$d;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Ll/quq$d;->b:Ll/jl80;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Ll/quq$d;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const-string v0, "p_home,verification_card"

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->advanced_filter:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 6
    .line 7
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/purchase/c;->x0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;)V

    .line 8
    .line 9
    .line 10
    const-string p1, "e_only_show_verified_buy_svip"

    .line 11
    .line 12
    const-string v0, "p_only_show_verified_ask_popup"

    .line 13
    .line 14
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/quq$d;->b:Ll/jl80;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 20
    .line 21
    .line 22
    return-void
.end method
