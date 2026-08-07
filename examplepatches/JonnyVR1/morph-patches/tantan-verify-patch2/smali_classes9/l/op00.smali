.class public final synthetic Ll/op00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pp00;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/pp00;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/op00;->a:Ll/pp00;

    iput-object p2, p0, Ll/op00;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/op00;->a:Ll/pp00;

    iget-object p0, p0, Ll/op00;->b:Ljava/lang/String;

    check-cast p1, Lcom/p1/mobile/putong/data/Detect;

    invoke-static {v0, p0, p1}, Ll/pp00;->i(Ll/pp00;Ljava/lang/String;Lcom/p1/mobile/putong/data/Detect;)V

    return-void
.end method
