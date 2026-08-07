.class Ll/as4$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/as4;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/as4;


# direct methods
.method public constructor <init>(Ll/as4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/as4$a;->a:Ll/as4;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/as4$a;->a:Ll/as4;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/as4;->a(Ll/as4;Z)Z

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/as4$a;->a:Ll/as4;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/as4;->b(Ll/as4;Z)Z

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/as4$a;->a:Ll/as4;

    .line 13
    .line 14
    invoke-static {p0}, Ll/as4;->d(Ll/as4;)I

    .line 15
    .line 16
    .line 17
    return-void
.end method
