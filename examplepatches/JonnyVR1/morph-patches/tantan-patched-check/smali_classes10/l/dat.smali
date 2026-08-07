.class public final synthetic Ll/dat;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/eat;


# direct methods
.method public synthetic constructor <init>(Ll/eat;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dat;->a:Ll/eat;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dat;->a:Ll/eat;

    invoke-static {p0}, Ll/eat;->M3(Ll/eat;)V

    return-void
.end method
