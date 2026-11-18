# Use the current connection for Vodafone Cash

- **Id:** `vodafone.cash.current-connection`
- **Status:** derived
- **Default enabled:** yes
- **Risk:** medium
- **Category:** Interface

## Observable behaviour

The stock build puts the requests of the Vodafone Cash service on the mobile
data connection of the line before every request, and the screen that opens the
service refuses to open when the device is not on that connection. It then says
that the cash service is not available through Wi-Fi.

After patching, the requests go out over the connection the device already has
and the screen opens. Whether the operator answers the requests is the
operator's own decision, and this patch does not change what the operator
answers.

## Preconditions

None. The network is put on the mobile data before every cash request, and the
screen of the cash service checks the connection of the device on its own.

## Acceptance criteria

- [ ] The cash section of the application opens when the device is on a
      connection that is not the mobile data of the line.
- [ ] The balance of the cash account is shown, when the operator answers over
      that connection.
- [ ] A transaction is carried out, when the operator allows it over that
      connection.
- [ ] Nothing else about the cash service changes: the same requests are made
      and the same answers are shown.
- [ ] Turning the patch off restores the stock behaviour.

## Out of scope

What the operator decides about a cash request. The patch changes the
connection the request goes out over; it does not change the operator's
answer, and the operator ties the cash service to the mobile network of the
line on purpose.

## Limitations

- The operator checks that a transaction comes from the mobile network of the
  line. A request that goes out over another connection is therefore likely to
  be refused, and the operator's own message is then shown. This patch makes
  the application try over the connection it has; it cannot make the operator
  accept it.
- The cash service also reads the identity of the line from the card of the
  device. A device without the card of the line has no such identity to read.
- The patch changes the connection of the cash requests only. The rest of the
  application talks to the operator over the connection it always used.

## Open questions

- What does the operator answer over a connection that is not the mobile data
  of the line? Not answered: the operator's answer was not observed.

## Verification

1. Install the patched build and sign in.
2. Turn the mobile data off and keep the connection the device has.
3. Open the Vodafone Cash service and confirm that the application does not ask
   for the mobile data.
4. Confirm what the operator answers over that connection.
5. Disable the patch, rebuild and install, and confirm that the stock
   behaviour returns.

## Provenance

- Spec author and date: Kero309x, 2026-11-11
- Derived: 2026-11-11 from the stock build. Derivation record:
  `docs/provenance/LOG.md`, section `vodafone.cash.current-connection`.
