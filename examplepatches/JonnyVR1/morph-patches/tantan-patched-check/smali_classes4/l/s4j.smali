.class public final synthetic Ll/s4j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/t4j;


# direct methods
.method public synthetic constructor <init>(Ll/t4j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s4j;->a:Ll/t4j;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s4j;->a:Ll/t4j;

    invoke-virtual {p0}, Ll/t4j;->i()V

    return-void
.end method
