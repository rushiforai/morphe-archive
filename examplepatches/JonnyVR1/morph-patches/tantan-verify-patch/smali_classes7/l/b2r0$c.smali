.class Ll/b2r0$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/b2r0;->H(Ljava/lang/String;)Ll/swq0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Ll/b2r0;


# direct methods
.method public constructor <init>(Ll/b2r0;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/b2r0$c;->b:Ll/b2r0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/b2r0$c;->a:Ljava/lang/String;

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
    invoke-static {}, Ll/xwq0;->a()Ll/xwq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/b2r0$c;->a:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, p0, v1}, Ll/xwq0;->a(Ljava/lang/String;Z)Ll/swq0;

    .line 9
    .line 10
    .line 11
    return-void
.end method
