.class public final synthetic Ll/g370;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/g370;->a:I

    iput-object p2, p0, Ll/g370;->b:Ljava/lang/String;

    iput-object p3, p0, Ll/g370;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget v0, p0, Ll/g370;->a:I

    iget-object v1, p0, Ll/g370;->b:Ljava/lang/String;

    iget-object p0, p0, Ll/g370;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/v370;->e(ILjava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
