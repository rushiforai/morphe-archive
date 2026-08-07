.class public final synthetic Ll/ia9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/qa9;


# direct methods
.method public synthetic constructor <init>(Ll/qa9;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ia9;->a:Ll/qa9;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ia9;->a:Ll/qa9;

    invoke-static {p0}, Ll/qa9;->p3(Ll/qa9;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
