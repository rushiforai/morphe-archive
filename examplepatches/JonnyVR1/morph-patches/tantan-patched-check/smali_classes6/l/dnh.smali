.class public final synthetic Ll/dnh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/h80;


# direct methods
.method public synthetic constructor <init>(Ll/h80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dnh;->a:Ll/h80;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dnh;->a:Ll/h80;

    invoke-virtual {p0}, Ll/h80;->o()V

    return-void
.end method
