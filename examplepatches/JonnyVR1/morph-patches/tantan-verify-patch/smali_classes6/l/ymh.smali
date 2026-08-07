.class public final synthetic Ll/ymh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zmh;


# direct methods
.method public synthetic constructor <init>(Ll/zmh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ymh;->a:Ll/zmh;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ymh;->a:Ll/zmh;

    invoke-static {p0}, Ll/zmh;->Y1(Ll/zmh;)V

    return-void
.end method
