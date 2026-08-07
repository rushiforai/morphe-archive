.class public final synthetic Ll/ip5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/mp5;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/mp5;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ip5;->a:Ll/mp5;

    iput-object p2, p0, Ll/ip5;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ip5;->a:Ll/mp5;

    iget-object p0, p0, Ll/ip5;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    invoke-static {v0, p0, p1}, Ll/mp5;->c(Ll/mp5;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ComplimentFromOther;)V

    return-void
.end method
