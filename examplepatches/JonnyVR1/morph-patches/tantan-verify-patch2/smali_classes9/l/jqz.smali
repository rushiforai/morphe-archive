.class public final synthetic Ll/jqz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/tvz;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Location;


# direct methods
.method public synthetic constructor <init>(Ll/tvz;Lcom/p1/mobile/putong/data/Location;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jqz;->a:Ll/tvz;

    iput-object p2, p0, Ll/jqz;->b:Lcom/p1/mobile/putong/data/Location;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jqz;->a:Ll/tvz;

    iget-object p0, p0, Ll/jqz;->b:Lcom/p1/mobile/putong/data/Location;

    invoke-static {v0, p0}, Ll/tvz;->f9(Ll/tvz;Lcom/p1/mobile/putong/data/Location;)V

    return-void
.end method
