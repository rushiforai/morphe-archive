.class Ll/jre$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jre;->g(Ll/mre;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/mre;

.field final synthetic b:Ll/jre;


# direct methods
.method public constructor <init>(Ll/jre;Ll/mre;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jre$b;->b:Ll/jre;

    .line 2
    .line 3
    iput-object p2, p0, Ll/jre$b;->a:Ll/mre;

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
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jre$b;->b:Ll/jre;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jre;->j(Ll/jre;)Ll/jre$c;

    .line 4
    .line 5
    .line 6
    return-void
.end method
