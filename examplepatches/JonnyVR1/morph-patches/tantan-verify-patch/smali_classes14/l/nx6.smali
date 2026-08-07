.class public final synthetic Ll/nx6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/nx6;->a:I

    iput-object p2, p0, Ll/nx6;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Ll/nx6;->a:I

    iget-object p0, p0, Ll/nx6;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/qx6;->a3(ILjava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
