.class public final synthetic Ll/rd50;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ae50;


# direct methods
.method public synthetic constructor <init>(Ll/ae50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/rd50;->a:Ll/ae50;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rd50;->a:Ll/ae50;

    invoke-static {p0}, Ll/ae50;->g4(Ll/ae50;)V

    return-void
.end method
