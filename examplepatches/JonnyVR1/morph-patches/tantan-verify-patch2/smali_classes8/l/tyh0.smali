.class public final synthetic Ll/tyh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lv/a$a;


# direct methods
.method public synthetic constructor <init>(Lv/a$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tyh0;->a:Lv/a$a;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tyh0;->a:Lv/a$a;

    invoke-static {p0}, Lv/a$a;->a(Lv/a$a;)V

    return-void
.end method
