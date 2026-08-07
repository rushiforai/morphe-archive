.class public final synthetic Ll/mhe0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/qhe0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/qhe0;Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mhe0;->a:Ll/qhe0;

    iput-object p2, p0, Ll/mhe0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/mhe0;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mhe0;->a:Ll/qhe0;

    iget-object v1, p0, Ll/mhe0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/mhe0;->c:Ll/x20;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, v1, p0, p1}, Ll/qhe0;->n(Ll/qhe0;Lcom/p1/mobile/android/app/Act;Ll/x20;Landroid/util/Pair;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
