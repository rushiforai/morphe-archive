.class public final synthetic Ll/i79;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/r79;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/r79;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i79;->a:Ll/r79;

    iput-object p2, p0, Ll/i79;->b:Ljava/lang/String;

    iput p3, p0, Ll/i79;->c:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/i79;->a:Ll/r79;

    iget-object v1, p0, Ll/i79;->b:Ljava/lang/String;

    iget p0, p0, Ll/i79;->c:I

    invoke-static {v0, v1, p0}, Ll/r79;->d(Ll/r79;Ljava/lang/String;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method
