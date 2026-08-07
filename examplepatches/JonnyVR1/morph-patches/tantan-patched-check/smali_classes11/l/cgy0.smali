.class public final Ll/cgy0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Landroid/content/ComponentName;

.field public final synthetic b:Ll/xfy0;


# direct methods
.method public constructor <init>(Ll/xfy0;Landroid/content/ComponentName;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/cgy0;->a:Landroid/content/ComponentName;

    .line 2
    .line 3
    iput-object p1, p0, Ll/cgy0;->b:Ll/xfy0;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cgy0;->b:Ll/xfy0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/xfy0;->c:Ll/hcy0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/cgy0;->a:Landroid/content/ComponentName;

    .line 6
    .line 7
    invoke-static {v0, p0}, Ll/hcy0;->M(Ll/hcy0;Landroid/content/ComponentName;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
