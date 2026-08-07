.class public final synthetic Ll/m4a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/p4a;


# direct methods
.method public synthetic constructor <init>(Ll/p4a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m4a;->a:Ll/p4a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m4a;->a:Ll/p4a;

    check-cast p1, Lcom/p1/mobile/putong/data/Envelope;

    invoke-static {p0, p1}, Ll/p4a;->f3(Ll/p4a;Lcom/p1/mobile/putong/data/Envelope;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
