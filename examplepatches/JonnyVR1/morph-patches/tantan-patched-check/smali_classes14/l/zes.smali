.class public final synthetic Ll/zes;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/cfs;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/cfs;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zes;->a:Ll/cfs;

    iput-object p2, p0, Ll/zes;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zes;->a:Ll/cfs;

    iget-object p0, p0, Ll/zes;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, p0, p1}, Ll/cfs;->k(Ll/cfs;Lcom/p1/mobile/android/app/Act;Landroid/util/Pair;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method
