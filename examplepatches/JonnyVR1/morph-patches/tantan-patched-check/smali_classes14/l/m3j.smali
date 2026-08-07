.class public final synthetic Ll/m3j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/a4j;


# direct methods
.method public synthetic constructor <init>(Ll/a4j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/m3j;->a:Ll/a4j;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m3j;->a:Ll/a4j;

    invoke-static {p0}, Ll/a4j;->C(Ll/a4j;)V

    return-void
.end method
