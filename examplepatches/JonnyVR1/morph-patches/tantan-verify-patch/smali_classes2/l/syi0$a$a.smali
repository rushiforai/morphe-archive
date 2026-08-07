.class public Ll/syi0$a$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/syi0$a;->p()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/util/Pair;

.field public final synthetic b:Ll/syi0$a;


# direct methods
.method public constructor <init>(Ll/syi0$a;Landroid/util/Pair;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/syi0$a$a;->b:Ll/syi0$a;

    .line 2
    .line 3
    iput-object p2, p0, Ll/syi0$a$a;->a:Landroid/util/Pair;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/syi0$a$a;->b:Ll/syi0$a;

    .line 2
    .line 3
    iget-object v0, v0, Ll/syi0$a;->c:Ll/syi0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/syi0$a$a;->a:Landroid/util/Pair;

    .line 6
    .line 7
    iget-object v1, p0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Ll/z06;

    .line 10
    .line 11
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Ll/yk90;

    .line 14
    .line 15
    invoke-virtual {v0, v1, p0}, Ll/syi0;->g(Ll/z06;Ll/yk90;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
