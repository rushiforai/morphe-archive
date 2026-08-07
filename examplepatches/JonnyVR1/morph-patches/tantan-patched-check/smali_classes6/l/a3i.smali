.class public final synthetic Ll/a3i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/d3i;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/d3i;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/a3i;->a:Ll/d3i;

    iput-object p2, p0, Ll/a3i;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a3i;->a:Ll/d3i;

    iget-object p0, p0, Ll/a3i;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {v0, p0, p1}, Ll/d3i;->c(Ll/d3i;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method
