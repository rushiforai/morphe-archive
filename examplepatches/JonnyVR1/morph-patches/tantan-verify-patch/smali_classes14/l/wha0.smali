.class public final synthetic Ll/wha0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/aia0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Z


# direct methods
.method public synthetic constructor <init>(Ll/aia0;Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wha0;->a:Ll/aia0;

    iput-object p2, p0, Ll/wha0;->b:Lcom/p1/mobile/android/app/Act;

    iput-boolean p3, p0, Ll/wha0;->c:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wha0;->a:Ll/aia0;

    iget-object v1, p0, Ll/wha0;->b:Lcom/p1/mobile/android/app/Act;

    iget-boolean p0, p0, Ll/wha0;->c:Z

    check-cast p1, Landroid/util/Pair;

    invoke-static {v0, v1, p0, p1}, Ll/aia0;->d(Ll/aia0;Lcom/p1/mobile/android/app/Act;ZLandroid/util/Pair;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
