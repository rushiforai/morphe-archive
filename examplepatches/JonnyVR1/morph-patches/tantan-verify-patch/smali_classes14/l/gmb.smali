.class public final synthetic Ll/gmb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/enb;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/enb;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gmb;->a:Ll/enb;

    iput-object p2, p0, Ll/gmb;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gmb;->a:Ll/enb;

    iget-object p0, p0, Ll/gmb;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Ll/enb;->b3(Ll/enb;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
