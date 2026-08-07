.class public final synthetic Ll/yha0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ll/aia0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Landroid/util/Pair;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Ll/aia0;Lcom/p1/mobile/android/app/Act;Landroid/util/Pair;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yha0;->a:Ll/aia0;

    iput-object p2, p0, Ll/yha0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/yha0;->c:Landroid/util/Pair;

    iput-boolean p4, p0, Ll/yha0;->d:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yha0;->a:Ll/aia0;

    iget-object v1, p0, Ll/yha0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/yha0;->c:Landroid/util/Pair;

    iget-boolean p0, p0, Ll/yha0;->d:Z

    check-cast p1, Ll/gcg0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/aia0;->h(Ll/aia0;Lcom/p1/mobile/android/app/Act;Landroid/util/Pair;ZLl/gcg0;)V

    return-void
.end method
