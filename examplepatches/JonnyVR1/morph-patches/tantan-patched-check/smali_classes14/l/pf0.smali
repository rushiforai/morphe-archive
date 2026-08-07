.class public final synthetic Ll/pf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pf0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/pf0;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pf0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/pf0;->b:Ll/y20;

    check-cast p1, Ljava/lang/String;

    invoke-static {v0, p0, p1}, Ll/yf0;->b(Lcom/p1/mobile/android/app/Act;Ll/y20;Ljava/lang/String;)V

    return-void
.end method
