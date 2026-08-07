.class public final synthetic Ll/jgy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/lgy;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/lgy;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jgy;->a:Ll/lgy;

    iput-object p2, p0, Ll/jgy;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jgy;->a:Ll/lgy;

    iget-object p0, p0, Ll/jgy;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Ll/lgy;->k(Ll/lgy;Lcom/p1/mobile/android/app/Act;Landroid/util/Pair;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
