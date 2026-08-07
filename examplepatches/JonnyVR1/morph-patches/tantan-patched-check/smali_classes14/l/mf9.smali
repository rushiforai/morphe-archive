.class public final synthetic Ll/mf9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/xf9;

.field public final synthetic b:Ljava/lang/StringBuilder;


# direct methods
.method public synthetic constructor <init>(Ll/xf9;Ljava/lang/StringBuilder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mf9;->a:Ll/xf9;

    iput-object p2, p0, Ll/mf9;->b:Ljava/lang/StringBuilder;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mf9;->a:Ll/xf9;

    iget-object p0, p0, Ll/mf9;->b:Ljava/lang/StringBuilder;

    invoke-static {v0, p0}, Ll/xf9;->r3(Ll/xf9;Ljava/lang/StringBuilder;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
