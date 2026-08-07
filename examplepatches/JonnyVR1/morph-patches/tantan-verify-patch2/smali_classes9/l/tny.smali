.class public final synthetic Ll/tny;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/boy;


# direct methods
.method public synthetic constructor <init>(Ll/boy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tny;->a:Ll/boy;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tny;->a:Ll/boy;

    invoke-static {p0}, Ll/vny;->c(Ll/boy;)V

    return-void
.end method
