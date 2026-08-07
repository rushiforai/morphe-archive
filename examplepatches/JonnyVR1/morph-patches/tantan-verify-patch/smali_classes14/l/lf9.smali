.class public final synthetic Ll/lf9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/xf9;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/xf9;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lf9;->a:Ll/xf9;

    iput-object p2, p0, Ll/lf9;->b:Ljava/lang/String;

    iput p3, p0, Ll/lf9;->c:I

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lf9;->a:Ll/xf9;

    iget-object v1, p0, Ll/lf9;->b:Ljava/lang/String;

    iget p0, p0, Ll/lf9;->c:I

    invoke-static {v0, v1, p0}, Ll/xf9;->t3(Ll/xf9;Ljava/lang/String;I)Lrx/c;

    move-result-object p0

    return-object p0
.end method
