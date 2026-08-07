.class public final synthetic Ll/q5k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/s5k;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/s5k;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q5k;->a:Ll/s5k;

    iput-object p2, p0, Ll/q5k;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q5k;->a:Ll/s5k;

    iget-object p0, p0, Ll/q5k;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/s5k;->r(Ll/s5k;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void
.end method
