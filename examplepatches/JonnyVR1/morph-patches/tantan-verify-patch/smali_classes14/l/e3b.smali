.class public final synthetic Ll/e3b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ljava/lang/StringBuilder;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/e3b;->a:Ljava/lang/StringBuilder;

    iput-object p2, p0, Ll/e3b;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/e3b;->a:Ljava/lang/StringBuilder;

    iget-object p0, p0, Ll/e3b;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested;->U4(Ljava/lang/StringBuilder;Ljava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
