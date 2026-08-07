.class public final synthetic Ll/o070;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/c170;


# direct methods
.method public synthetic constructor <init>(Ll/c170;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o070;->a:Ll/c170;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/o070;->a:Ll/c170;

    invoke-static {p0}, Ll/c170;->F(Ll/c170;)V

    return-void
.end method
