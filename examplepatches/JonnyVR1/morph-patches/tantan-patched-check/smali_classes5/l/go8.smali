.class public final synthetic Ll/go8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog$d;


# instance fields
.field public final synthetic a:Ll/y20;

.field public final synthetic b:Ll/y20;


# direct methods
.method public synthetic constructor <init>(Ll/y20;Ll/y20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/go8;->a:Ll/y20;

    iput-object p2, p0, Ll/go8;->b:Ll/y20;

    return-void
.end method


# virtual methods
.method public final a(Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;III)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/go8;->a:Ll/y20;

    iget-object v1, p0, Ll/go8;->b:Ll/y20;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->P(Ll/y20;Ll/y20;Lcom/wdullaer/materialdatetimepicker/date/DatePickerDialog;III)V

    return-void
.end method
