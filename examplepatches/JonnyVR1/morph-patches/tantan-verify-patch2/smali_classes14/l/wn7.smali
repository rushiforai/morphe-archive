.class public final synthetic Ll/wn7;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/no7;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/no7;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wn7;->a:Ll/no7;

    iput-object p2, p0, Ll/wn7;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/wn7;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wn7;->a:Ll/no7;

    iget-object v1, p0, Ll/wn7;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/wn7;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/no7;->x3(Ll/no7;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
