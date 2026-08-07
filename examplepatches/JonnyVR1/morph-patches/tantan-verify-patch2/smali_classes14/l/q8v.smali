.class public final synthetic Ll/q8v;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qcj;


# instance fields
.field public final synthetic a:Ll/w8v;


# direct methods
.method public synthetic constructor <init>(Ll/w8v;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q8v;->a:Ll/w8v;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q8v;->a:Ll/w8v;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-static {p0, p1}, Ll/w8v;->r2(Ll/w8v;Lcom/p1/mobile/android/app/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
