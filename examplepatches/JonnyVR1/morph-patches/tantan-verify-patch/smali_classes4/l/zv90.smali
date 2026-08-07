.class public final synthetic Ll/zv90;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/aw90;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/z20;

.field public final synthetic d:Landroid/util/Pair;


# direct methods
.method public synthetic constructor <init>(Ll/aw90;Lcom/p1/mobile/android/app/Act;Ll/z20;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zv90;->a:Ll/aw90;

    iput-object p2, p0, Ll/zv90;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/zv90;->c:Ll/z20;

    iput-object p4, p0, Ll/zv90;->d:Landroid/util/Pair;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zv90;->a:Ll/aw90;

    iget-object v1, p0, Ll/zv90;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/zv90;->c:Ll/z20;

    iget-object p0, p0, Ll/zv90;->d:Landroid/util/Pair;

    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    invoke-static {v0, v1, v2, p0, p1}, Ll/aw90;->b(Ll/aw90;Lcom/p1/mobile/android/app/Act;Ll/z20;Landroid/util/Pair;Lcom/p1/mobile/putong/data/Media;)V

    return-void
.end method
