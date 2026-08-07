.class public Ll/u6e$b;
.super Ll/r2i0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/u6e;->i(Ljava/lang/String;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/u6e;


# direct methods
.method public constructor <init>(Ll/u6e;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u6e$b;->b:Ll/u6e;

    .line 2
    .line 3
    iput-object p2, p0, Ll/u6e$b;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/r2i0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u6e$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public run()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/u6e$b;->a:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/u6e$b;->b:Ll/u6e;

    .line 12
    .line 13
    invoke-static {p0}, Ll/u6e;->c(Ll/u6e;)Ll/msl;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-interface {p0, v0, v1}, Ll/msl;->a(Ljava/util/HashSet;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
