.class public final synthetic Ll/elf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/rlf;


# direct methods
.method public synthetic constructor <init>(Ll/rlf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/elf;->a:Ll/rlf;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/elf;->a:Ll/rlf;

    invoke-static {p0}, Ll/rlf;->j(Ll/rlf;)V

    return-void
.end method
