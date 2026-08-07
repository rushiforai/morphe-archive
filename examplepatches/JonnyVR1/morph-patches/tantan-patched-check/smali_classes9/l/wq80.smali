.class public final synthetic Ll/wq80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/xs80;


# direct methods
.method public synthetic constructor <init>(Ll/xs80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wq80;->a:Ll/xs80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wq80;->a:Ll/xs80;

    check-cast p1, Lcom/p1/mobile/android/app/c;

    invoke-virtual {p0, p1}, Ll/xs80;->b(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method
