.class public final synthetic Ll/p770;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/w770;


# direct methods
.method public synthetic constructor <init>(Ll/w770;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/p770;->a:Ll/w770;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p770;->a:Ll/w770;

    invoke-static {p0}, Ll/w770;->x0(Ll/w770;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
