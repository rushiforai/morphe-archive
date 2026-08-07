.class public final synthetic Ll/odm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ll/qdm;


# direct methods
.method public synthetic constructor <init>(Ll/qdm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/odm;->a:Ll/qdm;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/odm;->a:Ll/qdm;

    invoke-static {p0}, Ll/qdm;->b(Ll/qdm;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method
