.class public final synthetic Ll/nk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/sk0;

.field public final synthetic b:Ljava/lang/Number;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/sk0;Ljava/lang/Number;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nk0;->a:Ll/sk0;

    iput-object p2, p0, Ll/nk0;->b:Ljava/lang/Number;

    iput-object p3, p0, Ll/nk0;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nk0;->a:Ll/sk0;

    iget-object v1, p0, Ll/nk0;->b:Ljava/lang/Number;

    iget-object p0, p0, Ll/nk0;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/sk0;->k(Ll/sk0;Ljava/lang/Number;Ljava/lang/String;)Ljava/lang/Void;

    move-result-object p0

    return-object p0
.end method
