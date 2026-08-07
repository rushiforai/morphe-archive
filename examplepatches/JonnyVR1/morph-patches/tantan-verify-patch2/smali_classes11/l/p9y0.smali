.class public final Ll/p9y0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Z

.field public final synthetic b:Landroid/net/Uri;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ljava/lang/String;

.field public final synthetic e:Ll/k8y0;


# direct methods
.method public constructor <init>(Ll/k8y0;ZLandroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-boolean p2, p0, Ll/p9y0;->a:Z

    .line 2
    .line 3
    iput-object p3, p0, Ll/p9y0;->b:Landroid/net/Uri;

    .line 4
    .line 5
    iput-object p4, p0, Ll/p9y0;->c:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p5, p0, Ll/p9y0;->d:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p1, p0, Ll/p9y0;->e:Ll/k8y0;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/p9y0;->e:Ll/k8y0;

    .line 2
    .line 3
    iget-boolean v1, p0, Ll/p9y0;->a:Z

    .line 4
    .line 5
    iget-object v2, p0, Ll/p9y0;->b:Landroid/net/Uri;

    .line 6
    .line 7
    iget-object v3, p0, Ll/p9y0;->c:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Ll/p9y0;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, v3, p0}, Ll/k8y0;->a(Ll/k8y0;ZLandroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
