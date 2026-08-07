.class public final synthetic Ll/w3l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/x3l;


# direct methods
.method public synthetic constructor <init>(Ll/x3l;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/w3l;->a:Ll/x3l;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w3l;->a:Ll/x3l;

    check-cast p1, Ljava/lang/Throwable;

    invoke-static {p0, p1}, Ll/x3l;->N(Ll/x3l;Ljava/lang/Throwable;)V

    return-void
.end method
