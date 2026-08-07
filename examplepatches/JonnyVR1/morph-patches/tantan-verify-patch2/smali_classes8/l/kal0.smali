.class public final synthetic Ll/kal0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pal0;


# direct methods
.method public synthetic constructor <init>(Ll/pal0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kal0;->a:Ll/pal0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kal0;->a:Ll/pal0;

    invoke-static {p0}, Ll/pal0;->A(Ll/pal0;)V

    return-void
.end method
