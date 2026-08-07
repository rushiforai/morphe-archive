.class public final synthetic Ll/tsg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/wsg;

.field public final synthetic b:Z

.field public final synthetic c:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/wsg;ZLcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tsg;->a:Ll/wsg;

    iput-boolean p2, p0, Ll/tsg;->b:Z

    iput-object p3, p0, Ll/tsg;->c:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tsg;->a:Ll/wsg;

    iget-boolean v1, p0, Ll/tsg;->b:Z

    iget-object p0, p0, Ll/tsg;->c:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Ll/pf60;

    invoke-static {v0, v1, p0, p1}, Ll/wsg;->b(Ll/wsg;ZLcom/p1/mobile/android/app/Act;Ll/pf60;)V

    return-void
.end method
