.class public final synthetic Ll/isk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/jl80;

.field public final synthetic c:Ll/x20;

.field public final synthetic d:Z

.field public final synthetic e:Lv/VEditText;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ll/x20;ZLv/VEditText;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/isk;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/isk;->b:Ll/jl80;

    iput-object p3, p0, Ll/isk;->c:Ll/x20;

    iput-boolean p4, p0, Ll/isk;->d:Z

    iput-object p5, p0, Ll/isk;->e:Lv/VEditText;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/isk;->a:Lcom/p1/mobile/android/app/Act;

    iget-object v1, p0, Ll/isk;->b:Ll/jl80;

    iget-object v2, p0, Ll/isk;->c:Ll/x20;

    iget-boolean v3, p0, Ll/isk;->d:Z

    iget-object v4, p0, Ll/isk;->e:Lv/VEditText;

    move-object v5, p1

    check-cast v5, Ll/uxj0;

    invoke-static/range {v0 .. v5}, Ll/qtk;->q0(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ll/x20;ZLv/VEditText;Ll/uxj0;)V

    return-void
.end method
